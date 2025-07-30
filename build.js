import { build } from 'vite';
import { remixConfig } from './vite.config.js';

async function buildApp() {
  try {
    console.log('Building Remix app...');
    await build({
      ...remixConfig,
      build: {
        outDir: 'build',
        manifest: true,
        rollupOptions: {
          input: {
            client: 'app/root.tsx',
            server: 'app/entry.server.tsx'
          }
        }
      }
    });
    console.log('Build complete!');
  } catch (error) {
    console.error('Build failed:', error);
    process.exit(1);
  }
}

buildApp();