<script>
	import { Home } from 'lucide-svelte';
	import { ArrowUpRight } from 'lucide-svelte';
	import AccountCreation from '$lib/create_account.svelte';
	import '../app.css';
</script>

<div>
	<p class="title">FEEDS</p>
</div>
<br />

<a href="https://www.reddit.com/">
	<div class="title-container">
		<div class="icon-container">
			<Home />
		</div>
		<div>
			<p class="categ">Home</p>
		</div>
	</div>
</a>
<br />
<a href="https://www.reddit.com/">
	<div class="title-container">
		<div class="icon-container">
			<ArrowUpRight />
		</div>
		<p class="categ">Popular</p>
	</div>
</a>
<div class="l">
	<hr />
	<p>Create an account to follow your favorite communities and participate in conversations.</p>

	<br />

	<AccountCreation />
</div>

<!-- Source: https://www.w3schools.com/howto/howto_css_fixed_sidebar.asp -->

<style>
	.title {
		color: var(--text-2);
		font-size: small;
	}

	.categ {
		font-size: small;
	}

	.title-container {
		display: flex;
	}

	.title-container:hover {
		background-color: var(--hover-sidebar);
	}

	.icon-container {
		padding-right: 6px;
	}

	a,
	a:focus,
	a:active {
		text-decoration: none;
		color: inherit;
	}

	p {
		font-size: small;
		text-align: justify;
	}

	hr {
		margin-top: 550px;
		margin-bottom: 20px;
	}

	.lower-content {
	}
</style>
