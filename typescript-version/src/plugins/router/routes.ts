export const routes = [
  { path: '/', redirect: '/dashboard' },
  {
    path: '/',
    component: () => import('@/layouts/default.vue'),
    children: [
      {
        path: 'dashboard',
        component: () => import('@/pages/dashboard.vue'),
      },
      // Produtos
      {
        path: 'produtos',
        component: () => import('@/pages/produtos.vue'),
      },
      {
        path: 'novo-produto',
        component: () => import('@/pages/produtos/NovoProduto.vue'),
      },
      // Clientes
      {
        path: 'clientes',
        component: () => import('@/pages/clientes.vue'),
      },
      {
        path: 'novo-cliente',
        component: () => import('@/pages/clients/NovoCliente.vue'),
      },
      // Pedidos
      {
        path: 'pedidos',
        component: () => import('@/pages/pedidos.vue'),
      },
      {
        path: 'novo-pedido',
        component: () => import('@/pages/pedidos/NovoPedido.vue'),
      },
      // 
      {
        path: 'account-settings',
        component: () => import('@/pages/account-settings.vue'),
      },
      {
        path: 'typography',
        component: () => import('@/pages/typography.vue'),
      },
      {
        path: 'icons',
        component: () => import('@/pages/icons.vue'),
      },
      {
        path: 'cards',
        component: () => import('@/pages/cards.vue'),
      },
      {
        path: 'tables',
        component: () => import('@/pages/tables.vue'),
      },
      {
        path: 'form-layouts',
        component: () => import('@/pages/form-layouts.vue'),
      },
    ],
  },
  {
    path: '/',
    component: () => import('@/layouts/blank.vue'),
    children: [
      {
        path: 'login',
        component: () => import('@/pages/login.vue'),
      },
      {
        path: 'register',
        component: () => import('@/pages/register.vue'),
      },
      {
        path: '/:pathMatch(.*)*',
        component: () => import('@/pages/[...error].vue'),
      },
    ],
  },
]
