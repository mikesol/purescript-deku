module Deku.DOM.Attr.OnTouchcancel where

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

data OnTouchcancel = OnTouchcancel

instance Attr anything OnTouchcancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both (pure 
    { key: "touchcancel", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "touchcancel", value: cb' value })
instance Attr anything OnTouchcancel (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTouchcancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "touchcancel", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "touchcancel", value: cb' value })
instance Attr anything OnTouchcancel  Cb  where
  attr OnTouchcancel value = unsafeAttribute $ This $ pure $
    { key: "touchcancel", value: cb' value }
instance Attr anything OnTouchcancel (Event.Event  Cb ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' value }

instance Attr anything OnTouchcancel (ST.ST Global.Global  Cb ) where
  attr OnTouchcancel iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "touchcancel", value: cb' value }

instance Attr anything OnTouchcancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both (pure 
    { key: "touchcancel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchcancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchcancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTouchcancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "touchcancel", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "touchcancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchcancel  (Effect Unit)  where
  attr OnTouchcancel value = unsafeAttribute $ This $ pure $
    { key: "touchcancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchcancel (Event.Event  (Effect Unit) ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchcancel (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTouchcancel iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "touchcancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchcancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both (pure 
    { key: "touchcancel", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchcancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchcancel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTouchcancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "touchcancel", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "touchcancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchcancel  (Effect Boolean)  where
  attr OnTouchcancel value = unsafeAttribute $ This $ pure $
    { key: "touchcancel", value: cb' (Cb (const value)) }
instance Attr anything OnTouchcancel (Event.Event  (Effect Boolean) ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchcancel", value: cb' (Cb (const value)) }

instance Attr anything OnTouchcancel (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTouchcancel iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "touchcancel", value: cb' (Cb (const value)) }

instance Attr everything OnTouchcancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTouchcancel bothValues = unsafeAttribute $ Both (pure 
    { key: "touchcancel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchcancel", value: unset' })
instance Attr everything OnTouchcancel (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTouchcancel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "touchcancel", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "touchcancel", value: unset' })
instance Attr everything OnTouchcancel  Unit  where
  attr OnTouchcancel _ = unsafeAttribute $ This $ pure $
    { key: "touchcancel", value: unset' }
instance Attr everything OnTouchcancel (Event.Event  Unit ) where
  attr OnTouchcancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchcancel", value: unset' }

instance Attr everything OnTouchcancel (ST.ST Global.Global  Unit ) where
  attr OnTouchcancel iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "touchcancel", value: unset' }
