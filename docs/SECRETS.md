# Adding secret tokens to your keychain

macOS includes a [keychain CLI (AKA security binary)](https://ss64.com/osx/security.html) that we
have leveraged to store and retrieve "global" secrets for your development environment.

> 📝 The keychain cli might be updated in your system to use `security` instead of `secret`. In that case, follow the above link to store tokens.

## Setting Secrets

You might see in the shell init that two tokens are missing, `NPM_TOKEN` and `BUILDKITE_TOKEN`.

Login to those sites, ensure you're added to the organisation then create new tokens to use below:

```sh
secret set NPM_TOKEN "<YOUR_TOKEN>"
secret set BUILDKITE_TOKEN "<YOUR_TOKEN>"
```

To check that something was set we can use:

```sh
secret get MY_SECRET
```

To remove a secret use:

```sh
secret unset MY_SECRET
```

## Exporting Secrets

You can also script the export of secrets from the keychain into your environment.

We do this already in `.zshrc` for the tokens mentioned above, but you can add any others you need
to `.zshrc.local`.

```sh
secret export MY_SECRET
```

---

<div style="float:left">

  [BACK TO README](../README.md#Setup)
  
</div>
