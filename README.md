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

# d. liczba warstw - 8
# docker history pogoda-app:latest
![image](https://github.com/user-attachments/assets/c65915f4-4e4d-426e-80b9-65df3dc946b0)

# działająca aplikacja: 
![image](https://github.com/user-attachments/assets/8e7f8569-e409-4850-88a1-7f6f0e797a9d)
![image](https://github.com/user-attachments/assets/46351e29-1c1d-4893-98e5-18b21ff7d16b)

# Rozmiar - 328 MB
# docker images
![image](https://github.com/user-attachments/assets/acc86d90-b7bd-445a-a7b0-8f90b249ffd5)

# Healthcheck
![image](https://github.com/user-attachments/assets/4f8e0450-1e55-4a1a-a9a7-be7e54b17301)


