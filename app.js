const express = require("express");
const axios = require("axios");
const path = require("path");
const app = express();

const PORT = process.env.PORT || 3000;
const AUTHOR = "Julia Grzesiewicz"; 
const API_KEY = "c660c38c49b2cd64068c084795aba7aa"; // OpenWeatherMap API key

// Logging startup info
console.log(`Start: ${new Date().toISOString()}`);
console.log(`Autor: ${AUTHOR}`);
console.log(`Port: ${PORT}`);

app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));

const countries = {
  "PL": ["Warsaw", "Krakow", "Gdansk"],
  "DE": ["Berlin", "Munich", "Hamburg"],
  "US": ["New York", "Chicago", "Los Angeles"]
};

app.get("/", (req, res) => {
  res.render("index", { weather: null, countries });
});

app.post("/", async (req, res) => {
  const { country, city } = req.body;
  try {
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${city},${country}&appid=${API_KEY}&units=metric`;
    const response = await axios.get(url);
    const weather = {
      temp: response.data.main.temp,
      desc: response.data.weather[0].description,
      city: city,
      country: country
    };
    res.render("index", { weather, countries });
  } catch (err) {
    res.render("index", { weather: { error: "Nie udało się pobrać pogody." }, countries });
  }
});

app.listen(PORT, () => {
  // Already logged above
});
