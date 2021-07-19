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
    '@snowpack/plugin-react-refresh',
    '@snowpack/plugin-dotenv',
    '@jihchi/plugin-rescript',
    '@snowpack/plugin-sass',
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
