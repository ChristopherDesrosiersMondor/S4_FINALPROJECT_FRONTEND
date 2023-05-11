<script>
	import '../app.css';
	import * as config from '$lib/config';
	import { Search } from 'lucide-svelte';
</script>

<div class="search-container">
	<div id="SearchDropdown" class="search-level-one rounded-box-container rounded-box">
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
</div>

<!-- Source: https://www.reddit.com -->

<style>
	.search-container {
		fill: aqua;
		flex-grow: 1;
		margin: 0 auto;
		max-width: 690px;
		padding-bottom: 6px;
	}

	.search-level-one {
		fill: aqua;
		-ms-flex-positive: 1;
		flex-grow: 1;
		margin-left: 16px;
		margin-right: 16px;
		width: auto;
		height: auto;
	}

	.rounded-box-container {
		border: 1px solid transparent;
		border-radius: 4px;
		box-sizing: border-box;
		height: 36px;
		position: relative;
		min-width: 72px;
	}

	.search-level-two {
		-ms-flex-align: center;
		align-items: center;
		box-sizing: border-box;
		border: 1px solid var(--reg-border-color);
		border-radius: 1.25em;
		box-shadow: none;
		height: 40px;
		background-color: var(--searchbar-background-color);
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
		appearance: none;
		color: var(--text-2);
		font-size: 14px;
		line-height: 14px;
		margin-right: 16px;
		outline: none;
		width: 100%;
		background-color: var(--searchbar-background-color);
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
