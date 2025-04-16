{ pkgs
, inputs
, system
, lib
, homeManager
, ...
}: {
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;

    quickCss = "./mocha.theme.css";

    config = {
      useQuickCss = true;
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
      ];

      frameless = true;

      plugins = {

        fakeNitro = {
          enable = true;
          emojiSize = 64;
        };

        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
        };

        messageLogger = {
          enable = true;
          ignoreBots = true;
          ignoreSelf = true;
        };

        newGuildSettings = {
          enable = true;
          messages = "only@Mentions";
        };

        showHiddenChannels = {
          enable = true;
          showMode = "muted";
        };

        showMeYourName = {
          enable = true;
          mode = "user-nick";
        };
        
        imageZoom.enable = true;
        betterGifPicker.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
        consoleJanitor.enable = true;
        crashHandler.enable = true;
        emoteCloner.enable = true;
        favoriteEmojiFirst.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        gifPaste.enable = true;
        loadingQuotes.enable = true;
        memberCount.enable = true;
        moreCommands.enable = true;
        moreKaomoji.enable = true;
        noOnboardingDelay.enable = true;
        noProfileThemes.enable = true;
        noTypingAnimation.enable = true;
        nsfwGateBypass.enable = true;
        permissionsViewer.enable = true;
        plainFolderIcon.enable = true;
        platformIndicators.enable = true;
        pronounDB.enable = true;
        showConnections.enable = true;
        showHiddenThings.enable = true;
        showTimeoutDuration.enable = true;
        spotifyControls.enable = true;
        spotifyCrack.enable = true;
        stickerPaste.enable = true;
        themeAttributes.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
      };
    };
  };
}
