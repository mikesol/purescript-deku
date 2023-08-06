module Deku.DOM.Attr.OnPointerleave where

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

data OnPointerleave = OnPointerleave

instance Attr anything OnPointerleave (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerleave", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerleave", value: cb' value })
instance Attr anything OnPointerleave (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPointerleave (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerleave", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointerleave", value: cb' value })
instance Attr anything OnPointerleave  Cb  where
  attr OnPointerleave value = unsafeAttribute $ This $ pure $
    { key: "pointerleave", value: cb' value }
instance Attr anything OnPointerleave (Event.Event  Cb ) where
  attr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' value }

instance Attr anything OnPointerleave (ST.ST Global.Global  Cb ) where
  attr OnPointerleave iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerleave", value: cb' value }

instance Attr anything OnPointerleave (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerleave", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerleave (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPointerleave (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerleave", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerleave  (Effect Unit)  where
  attr OnPointerleave value = unsafeAttribute $ This $ pure $
    { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerleave (Event.Event  (Effect Unit) ) where
  attr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerleave (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPointerleave iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerleave (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerleave", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerleave", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerleave (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPointerleave (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerleave", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerleave", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerleave  (Effect Boolean)  where
  attr OnPointerleave value = unsafeAttribute $ This $ pure $
    { key: "pointerleave", value: cb' (Cb (const value)) }
instance Attr anything OnPointerleave (Event.Event  (Effect Boolean) ) where
  attr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const value)) }

instance Attr anything OnPointerleave (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPointerleave iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerleave", value: cb' (Cb (const value)) }

instance Attr everything OnPointerleave (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerleave bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerleave", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerleave", value: unset' })
instance Attr everything OnPointerleave (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPointerleave (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "pointerleave", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointerleave", value: unset' })
instance Attr everything OnPointerleave  Unit  where
  attr OnPointerleave _ = unsafeAttribute $ This $ pure $
    { key: "pointerleave", value: unset' }
instance Attr everything OnPointerleave (Event.Event  Unit ) where
  attr OnPointerleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerleave", value: unset' }

instance Attr everything OnPointerleave (ST.ST Global.Global  Unit ) where
  attr OnPointerleave iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "pointerleave", value: unset' }
