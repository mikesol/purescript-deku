module Deku.DOM.Attr.OnPlaying where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPlaying = OnPlaying

instance Deku.Attribute.Attr everything OnPlaying Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onplaying", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPlaying
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onplaying", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPlayingEffect =
  forall element
   . Deku.Attribute.Attr element OnPlaying (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPlaying Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onplaying", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPlaying (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onplaying", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
