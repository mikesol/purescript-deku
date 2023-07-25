module Deku.DOM.Attr.OnLoad where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnLoad = OnLoad

instance Deku.Attribute.Attr everything OnLoad Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onload", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnLoad
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onload", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnLoadEffect =
  forall element
   . Deku.Attribute.Attr element OnLoad (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnLoad Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onload", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnLoad (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onload", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
