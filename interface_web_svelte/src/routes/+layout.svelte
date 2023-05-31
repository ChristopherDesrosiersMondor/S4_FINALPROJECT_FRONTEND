<script lang="ts">
	import Header from '../lib/header.svelte';

	import 'iconify-icon';
	import 'open-props/buttons';
	import 'open-props/normalize';
	import 'open-props/style';

	import ModalCreateAccount from '$lib/modal_create_account.svelte';
	import ModalCreateAccountNext from '$lib/modal_create_account_next.svelte';
	import ModalCreateCommunity from '$lib/modal_create_community.svelte';
	import ModalLogin from '$lib/modal_login.svelte';
	import '../app.css';
	import Sidebar from '../lib/sidebar.svelte';

	let communities: any;
	/** @type {import('./$types').PageData} */
	export let data;
	if (data != null) {
		communities = data.communities;
	}
</script>

<div id="2x-container">
	<div class="theme">
		<div tabindex="-1">
			<div class="shortcut-focus" tabindex="-1">
				<div class="modals">
					<ModalCreateAccount />
					<ModalLogin />
					<ModalCreateAccountNext />
					<ModalCreateCommunity />
				</div>
				<div class="">
					<!-- Header -->
					<Header />
					<!-- Hidden infos -->
				</div>
				<div class="">
					<div class="main-container">
						<div>
							<!-- Side bar -->
							<Sidebar propValue={communities} />
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
</div>

<style>
	.modals {
		position: fixed;
		z-index: 109;
	}
	.main-container {
		padding-left: 270px;
		transition: margin-top 0.3s ease;
		padding-top: 48px;
	}

	.shortcut-focus {
		z-index: 1;
		outline: none;
	}
</style>
