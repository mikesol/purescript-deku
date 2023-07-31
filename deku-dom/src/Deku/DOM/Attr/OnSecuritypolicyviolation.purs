module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnSecuritypolicyviolation = OnSecuritypolicyviolation

instance Deku.Attribute.Attr everything OnSecuritypolicyviolation Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onsecuritypolicyviolation", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSecuritypolicyviolation
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onsecuritypolicyviolation", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnSecuritypolicyviolationEffect =
  forall element
   . Deku.Attribute.Attr element OnSecuritypolicyviolation (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSecuritypolicyviolation Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onsecuritypolicyviolation", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnSecuritypolicyviolation (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onsecuritypolicyviolation", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
