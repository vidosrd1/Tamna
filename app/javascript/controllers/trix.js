<script type="module">
import "https://cdn.skypack.dev/@rails/actiontext"
import * as Trix from "https://cdn.skypack.dev/trix"

  document.addEventListener("trix-file-accept", (e) => {
    // Always prevent attachments.
    e.preventDefault()
  })
</script>

<style>
  .trix-button-group.trix-button-group--file-tools {
    display: none;
  }
</style>

<link href="https://cdn.skypack.dev/trix/dist/trix.css" rel="stylesheet">

<trix-editor></trix-editor>
