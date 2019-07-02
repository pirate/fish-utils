function crosslink --description 'Cross-link grater-django, redux-time, warped-time, and monadical-react-components'
    set root /Users/squash/Desktop/Monadical/Code

    fuckyou $root/react-components/node_modules/redux-time
    ln -s $root/redux-time $root/react-components/node_modules/redux-time

    fuckyou $root/warped-time/node_modules/monadical-react-components
    ln -s $root/react-components $root/warped-time/node_modules/monadical-react-components

    fuckyou $root/redux-time/node_modules/monadical-react-components
    ln -s $root/react-components $root/redux-time/node_modules/monadical-react-components

    fuckyou $root/warped-time/node_modules/redux-time
    ln -s $root/redux-time $root/warped-time/node_modules/redux-time

    fuckyou $root/blitzka/grater-django/node_modules/redux-time
    ln -s $root/warped-time/node_modules/redux-time $root/blitzka/grater-django/node_modules/redux-time
end
