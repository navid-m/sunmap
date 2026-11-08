entry "./src/main.sx"
version "v0.1.0"
spectre_version "v0.0.15"

build release {
    flags "-release -dynamic -alt"
    output "./sunmap"
}

build dev {
    flags "-dynamic -alt"
    output "./sunmap-dev"
}
