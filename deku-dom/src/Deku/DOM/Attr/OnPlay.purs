module Deku.DOM.Attr.OnPlay where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPlay = OnPlay

instance Deku.Attribute.Attr everything OnPlay Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "play", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPlay
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "play", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnPlayEffect =
  forall element
   . Deku.Attribute.Attr element OnPlay (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPlay Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "play", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPlay (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "play", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
