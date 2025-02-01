# Etapa de construcción
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# Copia la solución y los archivos .csproj
COPY GameAPI.sln .
COPY Models/*.csproj Models/
COPY Business/*.csproj Business/
COPY Data/*.csproj Data/
COPY API/*.csproj API/

# Restaura dependencias
RUN dotnet restore

# Copia todo el código y construye la aplicación
COPY . .
WORKDIR /src/API
RUN dotnet publish -c Release -o /app/out

# Etapa de ejecución
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

# Ejecuta la aplicación
ENTRYPOINT ["dotnet", "GameAPI.API.dll"]