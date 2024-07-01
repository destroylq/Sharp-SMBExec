FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY ./SharpInvoke-SMBExec/*.csproj .
RUN dotnet restore

# copy and build everything else
COPY ./SharpInvoke-SMBExec/. .
WORKDIR /app
RUN dotnet publish -c Release -o out --no-restore
