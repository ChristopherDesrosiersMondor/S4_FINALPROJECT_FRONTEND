<script>
	import { Home } from 'lucide-svelte';
	import { ArrowUpRight } from 'lucide-svelte';
	import '../app.css';
</script>

<div><p class="title">FEEDS</p></div>
<br />

<div class="title-container">
	<div class="icon-container">
		<Home />
	</div>
	<div>
		<p class="categ">Home</p>
		<br />
	</div>
</div>
<div class="title-container">
	<div class="icon-container">
		<ArrowUpRight />
	</div>
	<p class="categ">Popular</p>
</div>

<!-- Source: https://www.w3schools.com/howto/howto_css_fixed_sidebar.asp -->

<style>
	.title {
		color: var(--text-2);
		font-size: small;
	}

	.categ {
		font-size: medium;
	}

	.title-container {
		display: flex;
	}

	.icon-container {
		padding-right: 6px;
	}
</style>
