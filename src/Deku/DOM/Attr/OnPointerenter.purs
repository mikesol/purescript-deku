module Deku.DOM.Attr.OnPointerenter where

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

data OnPointerenter = OnPointerenter

instance Attr anything OnPointerenter (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerenter", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointerenter", value: cb' value })
instance Attr anything OnPointerenter (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPointerenter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerenter", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pointerenter", value: cb' value })
instance Attr anything OnPointerenter  Cb  where
  attr OnPointerenter value = unsafeAttribute $ This $ pure $
    { key: "pointerenter", value: cb' value }
instance Attr anything OnPointerenter (Event.Event  Cb ) where
  attr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' value }

instance Attr anything OnPointerenter (ST.ST Global.Global  Cb ) where
  attr OnPointerenter iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerenter", value: cb' value }

instance Attr anything OnPointerenter (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerenter", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerenter", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerenter (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPointerenter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerenter", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerenter", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerenter  (Effect Unit)  where
  attr OnPointerenter value = unsafeAttribute $ This $ pure $
    { key: "pointerenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerenter (Event.Event  (Effect Unit) ) where
  attr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerenter (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPointerenter iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerenter (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerenter", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerenter", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerenter (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPointerenter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerenter", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerenter", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerenter  (Effect Boolean)  where
  attr OnPointerenter value = unsafeAttribute $ This $ pure $
    { key: "pointerenter", value: cb' (Cb (const value)) }
instance Attr anything OnPointerenter (Event.Event  (Effect Boolean) ) where
  attr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointerenter", value: cb' (Cb (const value)) }

instance Attr anything OnPointerenter (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPointerenter iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "pointerenter", value: cb' (Cb (const value)) }

instance Attr everything OnPointerenter (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerenter bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerenter", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerenter", value: unset' })
instance Attr everything OnPointerenter (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPointerenter (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "pointerenter", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointerenter", value: unset' })
instance Attr everything OnPointerenter  Unit  where
  attr OnPointerenter _ = unsafeAttribute $ This $ pure $
    { key: "pointerenter", value: unset' }
instance Attr everything OnPointerenter (Event.Event  Unit ) where
  attr OnPointerenter eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointerenter", value: unset' }

instance Attr everything OnPointerenter (ST.ST Global.Global  Unit ) where
  attr OnPointerenter iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "pointerenter", value: unset' }
