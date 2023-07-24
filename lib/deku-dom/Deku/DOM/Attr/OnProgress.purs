module Deku.DOM.Attr.OnProgress where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnProgress = OnProgress

instance Deku.Attribute.Attr everything OnProgress Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onProgress", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnProgress
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onProgress", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnProgressEffect =
  forall element
   . Deku.Attribute.Attr element OnProgress (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnProgress Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onProgress", value: _ } <<< Deku.Attribute.cb'
