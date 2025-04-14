# Zadanie1_chrmurka

# a. Zbudowanie obrazu:
# docker build -t pogoda-app .
![image](https://github.com/user-attachments/assets/1a8fcc20-6949-46f6-b176-9d9366c1fab9)

# b. uruchomienie kontenera na podstawie zbudowanego obrazu
# docker run -d -p 3000:3000 --name pogoda pogoda-app
![image](https://github.com/user-attachments/assets/f2b69099-9a8c-40d9-8afb-290330596053)

# c. logi, które wygenerowała opracowana aplikacja podczas  uruchamiana kontenera
# docker logs pogoda
![image](https://github.com/user-attachments/assets/1ed755ef-8c1e-4862-afa1-3a4aa252b4e3)

# d. liczba warstw - 6
# docker history pogoda-app:latest
![image](https://github.com/user-attachments/assets/a9e010b6-8444-414b-a222-6932acea89c2)

# działająca aplikacja: 
![image](https://github.com/user-attachments/assets/8e7f8569-e409-4850-88a1-7f6f0e797a9d)
![image](https://github.com/user-attachments/assets/46351e29-1c1d-4893-98e5-18b21ff7d16b)

#Rozmiar - 203 MB
# docker history pogoda-app:latest
![image](https://github.com/user-attachments/assets/c9350e85-b1e7-4cc2-9c05-4eced40e4f15)

