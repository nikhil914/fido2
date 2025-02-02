import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { ThemeComponent } from './theme/theme.component';
import { LayoutModule } from './theme/layouts/layout.module';
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ScriptLoaderService } from "./_services/script-loader.service";
import { RestService } from "./_services/rest.service";
import { ConstantsService } from "./_services/constants.service";
import { SharedService } from "./_services/shared.service";
import { AuthGuard } from "./auth/_guards";
import { ThemeRoutingModule } from "./theme/theme-routing.module";
import { RegisterLoginModule } from "./auth/registerAndLogin/registerLogin.module";
import { CookieService } from 'ngx-cookie-service';
import { LocationStrategy, HashLocationStrategy } from '@angular/common';
import { TRANSLATION_PROVIDERS, TranslatePipe, TranslationService } from './translation';
import { EditorModule } from '@tinymce/tinymce-angular';
import { PrettyjsonpipeModule } from './auth/pipes/prettyjsonpipe.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { MaterialModule } from './auth/material/material.module';


@NgModule({
    declarations: [
        ThemeComponent,
        AppComponent,
        TranslatePipe,
    ],
    imports: [
        LayoutModule,
        BrowserModule,
        BrowserAnimationsModule,
        AppRoutingModule,
        ThemeRoutingModule,
        RegisterLoginModule,
        FormsModule,
        EditorModule,
        PrettyjsonpipeModule,
        FlexLayoutModule,
        MaterialModule
    ],
    providers: [ScriptLoaderService,
        RestService,
        SharedService,
        CookieService,
        ConstantsService,
        TranslationService,
        AuthGuard,
        TRANSLATION_PROVIDERS,
        { provide: LocationStrategy, useClass: HashLocationStrategy }],
    bootstrap: [AppComponent]
})
export class AppModule { }
