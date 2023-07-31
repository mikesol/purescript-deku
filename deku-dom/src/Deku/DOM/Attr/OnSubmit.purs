module Deku.DOM.Attr.OnSubmit where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnSubmit = OnSubmit

instance Deku.Attribute.Attr everything OnSubmit Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "submit", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSubmit
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "submit", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnSubmitEffect =
  forall element
   . Deku.Attribute.Attr element OnSubmit (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSubmit Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "submit", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnSubmit (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "submit", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
