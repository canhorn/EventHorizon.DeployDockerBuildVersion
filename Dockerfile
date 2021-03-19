# Stage 1 - Publish .NET Project
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS dotnet-build
WORKDIR /source

COPY EventHorizon.DeployDockerBuildVersion.csproj ./

RUN dotnet restore ./EventHorizon.DeployDockerBuildVersion.csproj

COPY . .

RUN dotnet build -c Release --no-restore ./EventHorizon.DeployDockerBuildVersion.csproj

RUN dotnet publish --output /app/ --configuration Release --no-restore --no-build ./EventHorizon.DeployDockerBuildVersion.csproj

# Stage 2 - Runtime
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
ARG BUILD_VERSION=0.0.0-build
ENV APPLICATION_VERSION=$BUILD_VERSION

WORKDIR /app
COPY --from=dotnet-build /app .
ENTRYPOINT ["dotnet", "EventHorizon.DeployDockerBuildVersion.dll"]