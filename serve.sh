#!/bin/bash

# Simple script to serve Jekyll site locally without native extensions

echo "🌐 Starting Jekyll development server..."
echo "This will attempt different methods to run your site locally."
echo ""

# Method 1: Try with existing bundle
echo "📦 Method 1: Trying with existing bundle..."
if bundle exec jekyll serve --port 4000 2>/dev/null; then
    echo "✅ Success with bundle!"
    exit 0
fi

# Method 2: Try with just Jekyll
echo "📦 Method 2: Trying with Jekyll directly..."
if jekyll serve --port 4000 2>/dev/null; then
    echo "✅ Success with Jekyll!"
    exit 0
fi

# Method 3: Try with Docker (if available)
echo "📦 Method 3: Trying with Docker..."
if command -v docker >/dev/null 2>&1; then
    echo "Docker found, building container..."
    if docker-compose up --build; then
        echo "✅ Success with Docker!"
        exit 0
    fi
else
    echo "❌ Docker not found"
fi

# Method 4: Python simple server (fallback)
echo "📦 Method 4: Using Python simple server (fallback)..."
echo "⚠️  This won't process Jekyll files, but you can preview the structure"
echo "🌐 Open http://localhost:8000 in your browser"
echo "📝 To stop, press Ctrl+C"

if command -v python3 >/dev/null 2>&1; then
    cd _site 2>/dev/null || echo "Building site first..." && jekyll build --safe
    python3 -m http.server 8000
elif command -v python >/dev/null 2>&1; then
    cd _site 2>/dev/null || echo "Building site first..." && jekyll build --safe
    python -m SimpleHTTPServer 8000
else
    echo "❌ No suitable method found to serve the site"
    echo ""
    echo "🛠️  To fix this, please:"
    echo "1. Install Docker: https://docker.com/get-started"
    echo "2. Or fix Ruby/Jekyll: see LOCAL_DEVELOPMENT_MAC.md"
    echo "3. Or use GitHub Pages directly for preview"
    exit 1
fi
