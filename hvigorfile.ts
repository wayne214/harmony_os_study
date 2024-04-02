// Script for compiling build behavior. It is built in the build plug-in and cannot be modified currently.
export { appTasks } from '@ohos/hvigor-ohos-plugin';

// import {appTasks} from '@ohos/hvigor-ohos-plugin'

// 自定义task
// function myTask() {
//   return {
//     pluginId: 'myTask',
//     apply(pluginContext) {
//       pluginContext.registerTask({
//         name: 'HelloWorld',
//         run: (taskContext) => {
//           console.log("hello world")
//         }
//       })
//     }
//   }
// }
//
// // 自定义plugin
// function customPlugin(): HvigorPlugin {
//   return {
//     pluginId: 'customPlugin',
//     apply(node: HvigorNode) {
//       // 插件主体
//       console.log('hello customPlugin');
//     }
//   }
//
// }

// export default {
//   system: appTasks,
//   // plugins: [myTask]
// }