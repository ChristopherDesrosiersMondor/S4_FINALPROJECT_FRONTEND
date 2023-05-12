<script lang="ts">
	import { Moon, Sun } from 'lucide-svelte';
	import { theme, toggleTheme } from '../lib/theme';
</script>

<button on:click={toggleTheme} aria-label="Toggle theme">
	{#if $theme == 'dark'}
		<div>
			<Sun />
		</div>
	{:else}
		<div>
			<Moon />
		</div>
	{/if}
</button>

<style>
	button {
		padding-left: 30px;
		font-weight: inherit;
		background: none;
		border: none;
		box-shadow: none;
		overflow: hidden;
	}
</style>
