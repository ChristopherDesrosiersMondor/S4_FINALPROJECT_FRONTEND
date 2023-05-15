<script>
	import '../app.css';
	import * as config from '$lib/config';
	import { Search } from 'lucide-svelte';
</script>

<!-- ajouter icone anchor + checker pour changer couleur en css selon le mode light ou dark -->

<div id="SearchDropdown" class="search-level-one">
	<div class="search-level-two">
		<form action="" method="get" role="search" class="search-form">
			<label for="header-search-bar" class="label-search">
				<div class="icon-container">
					<Search />
				</div>
			</label>
			<input
				type="search"
				class="header-search-input"
				id="header-search-bar"
				placeholder="Search Hublot"
				value
			/>
		</form>
	</div>
</div>

<!-- Source: https://www.reddit.com -->

<style>
	.search-level-one {
		fill: var(--text-2);
		-ms-flex-positive: 1;
		flex-grow: 1;
		margin-left: 16px;
		margin-right: 16px;
		width: auto;
		height: auto;

		border: 1px solid transparent;
		border-radius: 4px;
		box-sizing: border-box;
		position: relative;
		min-width: 72px;
	}

	.search-level-two {
		display: flex;
		align-items: center;
		box-sizing: border-box;
		box-shadow: none;
		border-radius: 1.25em;
		height: 40px;
		background-color: var(--new-hublot-field);
		border: 1px solid var(--new-hublot-line);
	}

	.search-form {
		width: 100%;
		height: 100%;
		display: flex;
	}

	.label-search {
		display: flex;
		cursor: default;
	}

	.header-search-input {
		-webkit-appearance: none;
		appearance: none;
		color: var(--newRedditTheme-bodyText);
		font-size: 14px;
		line-height: 14px;
		margin-right: 16px;
		outline: none;
		width: 100%;
		background-color: var(--new-hublot-field);
		box-sizing: border-box;
	}

	::placeholder {
		color: var(--text-2);
	}

	.search-level-two:hover,
	.header-search-input:hover {
		background-color: var(--header-background);
	}

	.search-level-two:hover {
		border: 1px solid var(--hover-border-color);
	}

	.icon-container {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		padding: 0 9px 0 15px;
	}
</style>
