{ lib, fetchFromGitLab }:
lib.makeOverridable ({ token ? builtins.getEnv "GITLAB_TOKEN", ... }@args:
  let
    passthruAttrs = removeAttrs args [ "token" ];
    # TODO propagate the curlOptsList that may be in 'args' to fetchFromGitLab
  in fetchFromGitLab ({
    domain = "gitlab-sto.alstom.hub";
    curlOptsList = [ "--insecure" "--header" "PRIVATE-TOKEN: ${token}" ];
  } // passthruAttrs))
