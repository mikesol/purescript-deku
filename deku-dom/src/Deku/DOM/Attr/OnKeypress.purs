module Deku.DOM.Attr.OnKeypress where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnKeypress = OnKeypress

instance Deku.Attribute.Attr everything OnKeypress Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onkeypress", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnKeypress
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onkeypress", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnKeypressEffect =
  forall element
   . Deku.Attribute.Attr element OnKeypress (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnKeypress Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onkeypress", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnKeypress (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onkeypress", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
