# OpenAPI Generator (Dev Tool)

This package is a **development-only helper** used to generate Swift
client and types from an OpenAPI specification using Apple's
`swift-openapi-generator`.

The generator is **not** a dependency of the main package. Generated
Swift files are committed to the repository so consumers do not need the
generator or its transitive dependencies.

------------------------------------------------------------------------

## Why this exists

-   Avoid leaking `swift-openapi-generator` into consumer dependencies\
-   Run code generation locally or in CI only\
-   Keep generated code committed and reviewable

------------------------------------------------------------------------

## Usage

Run from the repository root:

``` bash
swift run --package-path Tools/gitsync-access-openapi-generator swift-openapi-generator generate   --output-directory Sources/GitSyncAccess/Generated   --config Tools/gitsync-access-openapi-generator/Sources/GitSyncAccessOpenAPIGenerator/openapi-generator-config.yaml   Tools/gitsync-access-openapi-generator/Sources/GitSyncAccessOpenAPIGenerator/openapi.yaml
```

This generates: - `Client.swift` - `Types.swift`

into `Sources/GitSyncAccess/Generated/`.

------------------------------------------------------------------------

## Configuration

Generator settings live in:

    Sources/DashboardAPI/openapi-generator-config.yaml

Example:

``` yaml
generate:
  - types
  - client
accessModifier: internal
```

Generated code is marked `internal`; public APIs should be exposed via
hand-written wrappers.

------------------------------------------------------------------------

## Notes

-   If you copy this tool package, for use in other projects, make sure to exclude project-related files like '.swiftpm', '.build',...
-   This package is **dev-only**
-   Do **not** add the generator to the main `Package.swift`
-   Consumers depend only on runtime + URLSession transport

------------------------------------------------------------------------

## CI (optional)

Run generation in CI and fail on diffs to ensure the client stays in
sync with the OpenAPI spec.
