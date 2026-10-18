# sysapps

The system applications of [Starry](https://github.com/nullptrinc/starrysky),
written in QML for [Stardust](https://github.com/nullptrinc/stardust) and
shipped as `.apf` packages for [cosmic](https://github.com/nullptrinc/cosmic).

| App | Id | |
|---|---|---|
| Батарея | `org.starry.battery` | the battery from Constellation, power saver switch |
| Материалы | `org.starry.materials` | the dark material set and the system accent |
| Телефон | `org.starry.phone` | a dialer, no telephony yet |

Each app is a directory under `apps/` with a `manifest.json` (see cosmic's
`SPEC.md`) and its QML. Bump `build` with every change that ships.

```sh
tools/build-apf.sh dev.key out/          # pack and sign every app
apf-sign-gpg --key <subkey> out/org.starry.battery.apf   # add the platform signature
cosmic install out/org.starry.battery.apf
```

Run an app without packing it: `stardust apps/battery/qml/main.qml`.

## License

MIT, see [LICENSE](LICENSE).
