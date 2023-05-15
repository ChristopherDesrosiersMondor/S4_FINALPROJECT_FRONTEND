<script lang="ts">
	import Header from './header.svelte';

	import 'open-props/style';
	import 'open-props/normalize';
	import 'open-props/buttons';
	import 'iconify-icon';

	import '../app.css';
	import Sidebar from '../lib/sidebar.svelte';
	import BackToTopButton from '../lib/backToTopButton.svelte';
</script>

<div id="2x-container">
	<div class="theme">
		<div tabindex="-1">
			<div class="shortcut-focus" tabindex="-1">
				<div class="">
					<!-- Header -->
					<Header />
					<!-- Hidden infos -->
				</div>
				<div class="">
					<div class="main-container">
						<div>
							<!-- Side bar -->
							<Sidebar />
						</div>
						<div>
							<!-- Main-Content -->
							<slot />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<main>
		<div class="sidebar">
			<Sidebar />
		</div>
		<div class="content">
			<slot />
			<div class="back_to_top_btn">
				<BackToTopButton />
			</div>
		</div>
	</main>
</div>

<style>
	.main-container {
		padding-left: 270px;
		transition: margin-top 0.3s ease;
		padding-top: 48px;
	}

	.shortcut-focus {
		outline: none;
	}

	.back_to_top_btn {
		margin-left: 1100px;
		margin-top: 730px;
		position: fixed;
	}
</style>
