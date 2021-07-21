/** @type {import("snowpack").SnowpackUserConfig } */
module.exports = {
  verbose: true,
  mount: {
    public: { url: '/', static: true },
    src: { url: '/dist' },
  },
  routes: [
    {
      match: 'routes',
      src: '.*',
      dest: '/index.html',
    },
  ],
  exclude: ['**/*.{res,resi}'],
  plugins: [
    'snowpack-plugin-relative-css-urls',
    '@snowpack/plugin-react-refresh',
    '@snowpack/plugin-dotenv',
    '@jihchi/plugin-rescript',
    '@snowpack/plugin-sass',
    '@snowpack/plugin-babel',
    '@snowpack/plugin-webpack',
    // [
    //   {
    //     extendConfig: (config) => {
    //       config.module.rules.push({
    //         test: /\.(png|jpe?g|gif|svg)$/i,
    //         use: [
    //           {
    //             loader: 'file-loader',
    //           },
    //         ],
    //       })
    //       return config
    //     },
    //   },
    // ],
  ],
  packageOptions: {
    packageLookupFields: ['main'],
  },
  devOptions: {
    open: 'none',
    hmr: false,
  },
  buildOptions: {
    /* ... */
  },
  alias: {
    /* ... */
    '~/**': './src',
  },
}
