with import (fetchTarball {
  url = https://github.com/NixOS/nixpkgs/archive/18.09.tar.gz;
  sha256 = "1ib96has10v5nr6bzf7v8kw7yzww8zanxgw2qi1ll1sbv6kj6zpd";
}) {};


let
    myPyPkgs = pyPkgs: with pyPkgs; [
        isort        # automatic import order formatting
        black        # automatic code formatting
    ];

    pythonWithPkgs = python3.withPackages myPyPkgs;
in
    mkShell {
        buildInputs = [
          pythonWithPkgs
          taskwarrior
        ];
    }
