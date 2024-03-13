FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Copier le fichier csproj de votre application API
COPY ["Arosaje/Arosaje.csproj", "API/Arosaje/"]

# Restaurer les dépendances
RUN dotnet restore "API/Arosaje/Arosaje.csproj"

# Copier le reste de l'application
COPY . .

WORKDIR "/src/API/Arosaje/"
RUN dotnet build "./Arosaje.csproj" -c $BUILD_CONFIGURATION -o /app/build


FROM build AS publish
ARG BUILD_CONFIGURATION=Release
WORKDIR "/src/API/Arosaje"
RUN dotnet publish -c $BUILD_CONFIGURATION -o /app/publish --no-restore


FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Arosaje.dll"]