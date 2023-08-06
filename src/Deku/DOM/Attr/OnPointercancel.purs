module Deku.DOM.Attr.OnPointercancel where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointercancel = OnPointercancel

instance Attr anything OnPointercancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both (pure 
    { key: "pointercancel", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointercancel", value: cb' value })
instance Attr anything OnPointercancel (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPointercancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointercancel", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointercancel", value: cb' value })
instance Attr anything OnPointercancel  Cb  where
  attr OnPointercancel value = unsafeAttribute $ This $ pure $
    { key: "pointercancel", value: cb' value }
instance Attr anything OnPointercancel (Event.Event  Cb ) where
  attr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "pointercancel", value: cb' value }

instance Attr anything OnPointercancel (ST.ST Global.Global  Cb ) where
  attr OnPointercancel iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "pointercancel", value: cb' value }

instance Attr anything OnPointercancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both (pure 
    { key: "pointercancel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointercancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPointercancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointercancel", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointercancel  (Effect Unit)  where
  attr OnPointercancel value = unsafeAttribute $ This $ pure $
    { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointercancel (Event.Event  (Effect Unit) ) where
  attr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "pointercancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointercancel (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPointercancel iValue = unsafeAttribute $ This $ iValue
    <#> \value ->
      { key: "pointercancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointercancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both (pure 
    { key: "pointercancel", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointercancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointercancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPointercancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointercancel", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointercancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointercancel  (Effect Boolean)  where
  attr OnPointercancel value = unsafeAttribute $ This $ pure $
    { key: "pointercancel", value: cb' (Cb (const value)) }
instance Attr anything OnPointercancel (Event.Event  (Effect Boolean) ) where
  attr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "pointercancel", value: cb' (Cb (const value)) }

instance Attr anything OnPointercancel (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPointercancel iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "pointercancel", value: cb' (Cb (const value)) }

instance Attr everything OnPointercancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointercancel bothValues = unsafeAttribute $ Both (pure 
    { key: "pointercancel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointercancel", value: unset' })
instance Attr everything OnPointercancel (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPointercancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "pointercancel", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointercancel", value: unset' })
instance Attr everything OnPointercancel  Unit  where
  attr OnPointercancel _ = unsafeAttribute $ This $ pure $
    { key: "pointercancel", value: unset' }
instance Attr everything OnPointercancel (Event.Event  Unit ) where
  attr OnPointercancel eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "pointercancel", value: unset' }

instance Attr everything OnPointercancel (ST.ST Global.Global  Unit ) where
  attr OnPointercancel iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "pointercancel", value: unset' }
