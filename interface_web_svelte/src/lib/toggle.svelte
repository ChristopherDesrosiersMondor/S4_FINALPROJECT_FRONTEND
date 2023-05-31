<script lang="ts">
	import { Moon, Sun } from 'lucide-svelte';
	import { theme, toggleTheme } from './theme';
</script>

<button on:click={toggleTheme} aria-label="Toggle theme" class="toggle-container">
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
	.toggle-container {
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 1.25em;
		box-shadow: none;
		box-sizing: border-box;
		height: 36px;
		position: relative;
		min-width: 72px;
	}

	button {
		padding-left: 30px;
		font-weight: inherit;
		background: none;
		border: none;
		box-shadow: none;
		overflow: hidden;
	}
</style>
