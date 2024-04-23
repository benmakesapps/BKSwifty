#!/bin/bash

# Base directory for scenes
BASE_DIR="./BKSwifty/Source/Scenes"

# Check if a scene name was provided
if [ -z "$1" ]; then
  echo "Error: No scene name provided."
  echo "Usage: $0 <SceneName>"
  exit 1
fi

SCENE_NAME="$1"
SCENES_DIR="${BASE_DIR}/${SCENE_NAME}"
TEMPLATES_DIR="${BASE_DIR}/Template"

# Create a directory for the new scene
if ! mkdir -p "$SCENES_DIR"; then
  echo "Failed to create directory '$SCENES_DIR'. Check permissions or disk space."
  exit 1
fi

# Function to create files from templates
create_file_from_template() {
    local template_file=$1
    local output_file=$2
    
    if [ ! -f "$template_file" ]; then
      echo "Template file $template_file does not exist."
      exit 1
    fi
    
    sed "s/Template/${SCENE_NAME}/g" "$template_file" > "$output_file"
    echo "Created $output_file"
}

# Create Coordinator, View, and ViewModel files from templates
create_file_from_template "$TEMPLATES_DIR/TemplateCoordinator.swift" "$SCENES_DIR/${SCENE_NAME}Coordinator.swift"
create_file_from_template "$TEMPLATES_DIR/TemplateView.swift" "$SCENES_DIR/${SCENE_NAME}View.swift"
create_file_from_template "$TEMPLATES_DIR/TemplateViewModel.swift" "$SCENES_DIR/${SCENE_NAME}ViewModel.swift"

echo "Scene files for '$SCENE_NAME' created in '$SCENES_DIR'."
