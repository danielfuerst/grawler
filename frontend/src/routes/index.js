const allNavLinks = [
    {
        name: 'home',
        title: 'Plan',
        headline: 'Pland your adventure',
        path: '/',
        component: () => import('./../views/Home.vue'),
    },
    {
        name: 'about',
        title: 'About',
        headline: 'About Grawler',
        path: '/about',
        component: () => import('./../views/About.vue'),
    },
];

const routes = allNavLinks.map(function ({name, path, component}) { return {name, path, component}});
const navItems = allNavLinks.map(function ({name, title}) { return {name, title}});

function getNavTitleByRouteName (name) {
    const item = allNavLinks.filter((n) => n.name === name)[0];
    return item ? item.headline : null;
}


export {routes, navItems, getNavTitleByRouteName};
