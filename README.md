[![CircleCI][circleci-url]][circleci-url]
[![PRs Welcome][pr-welcome-shield]][pr-welcome-url]
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <img alt="delineate.io" src="https://github.com/delineateio/.github/blob/master/assets/logo.png?raw=true" height="75" />
  <h2 align="center">delineate.io</h2>
  <p align="center">portray or describe (something) precisely.</p>

  <h3 align="center">Terraform GitHub</h3>

  <p align="center">
    IaC management of GitHub projects
    <br />
    <a href="https://github.com/delineateio/terraform-github"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/delineateio/terraform-github/issues">Report Bug</a>
    ·
    <a href="https://github.com/delineateio/terraform-github/issues">Request Feature</a>
  </p>
</p>

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [About The Project](#about-the-project)
- [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Local Dependencies](#local-dependencies)
  - [Local Setup](#local-setup)
- [Usage](#usage)
- [GitHub Provisioning](#github-provisioning)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- ABOUT THE PROJECT -->
## About The Project

This repo is used to consistently manage all projects within a GitHub organisation and provide automated centralised management.

* The GitHub repo [terraform-github](https://github.com/delineateio/terraform-github) is used to store the code
* The Terraform Cloud workspace [terraform-github](https://app.terraform.io/app/delineateio/workspaces/terraform-github) is used to manage provisioning

Terraform Cloud is setup to apply the changes on commit to the `main` branch.

## Built With

Further logos can be inserted to highlight the specific technologies used to create the solution from [here](https://github.com/Ileriayo/markdown-badges).

| Syntax | Description |
| --- | ----------- |
| ![pre-commit](https://img.shields.io/badge/precommit-%235835CC.svg?style=for-the-badge&logo=precommit&logoColor=white) | Pre-commit `git` hooks that perform checks before pushes|
| ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) | Source control management platform  |
| ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) | Cloud infrastructure provisioning configuration|

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Local Dependencies

A number of local dependencies are required.  To review the local dependencies run `task dependencies:list`.  If new local dependencies then they should be added to the correct Taskfile in `./os` e.g. `taskfile.darwin.yaml`.

> Note that currently only `macOS` is configured and a PR should be submitted if either `Linux` or `Windows` are required.

### Local Setup

This repo follows the principle of minimal manual setup of the local development environment.

 A `task` target has been provided for simplicity ```task init```, the `taskfile.yaml` file can be inspected for more details.

<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)._

## GitHub Provisioning

A boilerplate configuration is provided for using `terraform` configuration to provision cloud infrastructure.  [tfenv](https://github.com/tfutils/tfenv) is used to select the version of `terraform` to use.  The repo template provides a single component in `ops/cloud/component`.

```shell
# plans the network terraform config
task github:plan

# auto approves applying the network terraform config
task github:apply
```

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/delineateio/terraform-github/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

If you would like to contribute to any delineate.io OSS projects please read:

* [Code of Conduct](https://github.com/delineateio/.github/blob/master/CODE_OF_CONDUCT.md)
* [Contributing Guidelines](https://github.com/delineateio/.github/blob/master/CONTRIBUTING.md)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Best README Template](https://github.com/othneildrew/Best-README-Template)
* [Markdown Badges](https://github.com/Ileriayo/markdown-badges)
* [DocToc](https://github.com/thlorenz/doctoc)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[circleci-url]: https://img.shields.io/circleci/build/gh/delineateio/terraform-github?style=for-the-badge&logo=circleci
[pr-welcome-shield]: https://img.shields.io/badge/PRs-welcome-ff69b4.svg?style=for-the-badge&logo=github
[pr-welcome-url]: https://github.com/delineateio/terraform-github/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue
[contributors-shield]: https://img.shields.io/github/contributors/delineateio/terraform-github.svg?style=for-the-badge&logo=github
[contributors-url]: https://github.com/delineateio/terraform-github/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/delineateio/terraform-github.svg?style=for-the-badge&logo=github
[forks-url]: https://github.com/delineateio/terraform-github/network/members
[stars-shield]: https://img.shields.io/github/stars/delineateio/terraform-github.svg?style=for-the-badge&logo=github
[stars-url]: https://github.com/delineateio/terraform-github/stargazers
[issues-shield]: https://img.shields.io/github/issues/delineateio/terraform-github.svg?style=for-the-badge&logo=github
[issues-url]: https://github.com/delineateio/terraform-github/issues
[license-shield]: https://img.shields.io/github/license/delineateio/terraform-github.svg?style=for-the-badge&logo=github
[license-url]: https://github.com/delineateio/terraform-github/blob/master/LICENSE
[product-screenshot]: https://github.com/delineateio/.github/blob/master/assets/screenshot.png?raw=true
