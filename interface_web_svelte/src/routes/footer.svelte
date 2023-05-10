<script lang="ts">
	import * as config from '$lib/config';
	import { CornerDownLeftIcon } from 'lucide-svelte';
	import '../app.css';
</script>

<div>
	<footer>
		<p>{config.title} &copy {new Date().getFullYear()}</p>
	</footer>
</div>

<style>
	footer {
		padding-block: var(--size-2);
		border-top: 1px solid var(--border);
	}

	p {
		color: var(--text-2);
		font-size: small;
	}
</style>
