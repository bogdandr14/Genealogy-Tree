export const environment = {
  production: true,
  baseApiUrl: 'https://genealogytreeapi20220630211142.azurewebsites.net', //TODO modify
  defaultLanguage: 'en',
  appSettings: {
    version: '',
    languages: [
      { translationKey: 'languageEN', iso: 'en-US', languageKey: 'en' },
      { translationKey: 'languageRO', iso: 'ro-RO', languageKey: 'ro' },
    ],
  },
};
