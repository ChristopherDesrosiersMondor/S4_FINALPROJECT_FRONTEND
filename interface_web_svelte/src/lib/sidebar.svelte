<script>
	import { Home } from 'lucide-svelte';
	import { ArrowUpRight } from 'lucide-svelte';
	import { TrendingUp } from 'lucide-svelte';
	import { Gamepad2 } from 'lucide-svelte';
	import { Trophy } from 'lucide-svelte';
	import { LineChart } from 'lucide-svelte';
	import { Currency } from 'lucide-svelte';
	import { Tv } from 'lucide-svelte';
	import { Star } from 'lucide-svelte';
	import AccountCreation from '$lib/create_account.svelte';
	import '../app.css';
</script>

<div class="sidebar-container">
	<div role="menu" class="sidebar-menu-container">
		<div class="sidebar-menu-section-title">Feeds</div>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><Home /></i>
			<span class="sidebar-items-text">Home</span>
		</a>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><TrendingUp /></i>
			<span class="sidebar-items-text">Popular</span>
		</a>
		<div class="sidebar-menu-section-title">Recent</div>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><Trophy /></i>
			<span class="sidebar-items-text">r/NoStupidQuestion</span>
		</a>
		<div class="sidebar-menu-section-title">Topics</div>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><Gamepad2 /></i>
			<span class="sidebar-items-text">Gaming</span>
		</a>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><Trophy /></i>
			<span class="sidebar-items-text">Sports</span>
		</a>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><LineChart /></i>
			<span class="sidebar-items-text">Business, Economics, and finance</span>
		</a>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><Currency /></i>
			<span class="sidebar-items-text">Crypto</span>
		</a>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><Tv /></i>
			<span class="sidebar-items-text">Television</span>
		</a>
		<a role="menuitem" class="sidebar-menu-link" tabindex="-1" aria-label="./" href="./">
			<i class="sidebar-icons icon"><Star /></i>
			<span class="sidebar-items-text">Celebrity</span>
		</a>
	</div>
	<div class="sidebar-footer-container">
		<div class="simple-divider-line-container" />
		<div class="l">
			<hr />
			<p>Créez un compte pour suivre vos communautés préférées et participer aux conversations.</p>

			<br />

			<AccountCreation />
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
	<div class="sidebar-footer-container">
		<div class="simple-divider-line-container" />
		<div class="l">
			<hr />
			<p>Créez un compte pour suivre vos communautés préférées et participer aux conversations.</p>

			<br />

			<AccountCreation />
		</div>
	</div>
</div>

<!-- Source: https://www.w3schools.com/howto/howto_css_fixed_sidebar.asp -->

<style>
	.sidebar-container {
		background-color: var(--hublot-body);
		bottom: 0;
		top: 48px;
		display: -ms-flexbox;
		display: flex;
		flex-direction: column;
		left: 0;
		overflow: hidden;
		position: fixed;
		width: 270px;
		z-index: 4;
	}

	.sidebar-menu-container {
		-ms-flex: 1;
		flex: 1;
		overflow-y: auto;
	}

	.sidebar-menu-section-title {
		color: var(--text-1);
		font-size: 10px;
		font-weight: 500;
		line-height: 16px;
		text-transform: uppercase;
		padding: 16px 24px 8px;
	}

	.sidebar-menu-link {
		padding: 8px 24px;
		position: relative;
		align-items: center;
		display: flex;
		flex-direction: row;
	}

	.icon:before {
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		font-family: redesignFont2020;
	}

	.sidebar-icons {
		-ms-flex-positive: 0;
		flex-grow: 0;
		height: 20px;
		max-height: 20px;
		max-width: 20px;
		width: 20px;
	}

	.sidebar-items-text {
		flex-grow: unset;
		font-size: 14px;
		line-height: 18px;
		margin-left: 8px;
		max-width: 208px;
		overflow: hidden;
		text-align: left;
		text-overflow: ellipsis;
		white-space: nowrap;
	}

	.icon {
		font-size: 20px;
		font-weight: 400;
		height: 20px;
		line-height: 20px;
		vertical-align: middle;
		width: 20px;
	}

	.sidebar-footer-container {
		padding: 20px 24px 40px;
	}

	.simple-divider-line-container {
		border-bottom: 1px solid rgba(0, 0, 0, 0.2);
		margin-bottom: 15px;
	}
</style>
