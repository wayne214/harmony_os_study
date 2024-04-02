import dataPreferences from '@ohos.data.preferences'

export default class Preferences {
  private static instance: Preferences;
  private context: Context;
  private preferences: dataPreferences.Preferences;

  private constructor(context: Context) {
    this.context = context;
  }

  private async checkInit():Promise<void> {
    if(!this.preferences) {
      this.preferences = await dataPreferences.getPreferences(this.context, "hhhhhhh")
    }
    return new Promise<void>((resolve, reject)=> {
      resolve();
    })
  }

  static get(context: Context): Preferences {
    if(Preferences.instance === undefined) {
      Preferences.instance = new Preferences(context);
    }
    return Preferences.instance;
  }

}