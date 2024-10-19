import { nodeResolve } from '@rollup/plugin-node-resolve';
import commonjs from '@rollup/plugin-commonjs';
import babel from '@rollup/plugin-babel';

export default {
  input: 'test/test.ts', // or 'test/test1.ts' if using TypeScript
  output: {
    file: 'dist/test.js',
    format: 'cjs', // CommonJS format for K6
    exports: 'named',
  },
  plugins: [
    nodeResolve(),
    commonjs(),
    babel({
      babelHelpers: 'bundled',
      extensions: ['.js', '.ts'],
    }),
    
  ],
  external: ['k6', 'http', 'k6/http'], // Ensure K6 modules are treated as external
};
