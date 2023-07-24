module Deku.DOM.Attr.OnSeeking where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnSeeking = OnSeeking

instance Deku.Attribute.Attr everything OnSeeking Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onSeeking", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSeeking
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onSeeking", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnSeekingEffect =
  forall element
   . Deku.Attribute.Attr element OnSeeking (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSeeking Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onSeeking", value: _ } <<< Deku.Attribute.cb'
