<script>
	import { Home } from 'lucide-svelte';
	import '../app.css';
</script>

<!-- Side navigation -->

<!-- svelte-ignore a11y-missing-attribute -->
<p class="title">FEEDS</p>
<br />
<!-- svelte-ignore a11y-missing-attribute -->
<p class="categ">Home</p>
<!-- svelte-ignore a11y-missing-attribute -->
<p class="categ">Popular</p>
<br />

<!-- Source: https://www.w3schools.com/howto/howto_css_fixed_sidebar.asp -->

<style>
	.title {
		color: var(--text-2);
		font-size: small;
	}

	.categ {
		font-size: medium;
	}
</style>
