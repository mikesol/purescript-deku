module Deku.DOM.Attr.OnMousedown where

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

data OnMousedown = OnMousedown

instance Attr anything OnMousedown (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMousedown bothValues = unsafeAttribute $ Both (pure 
    { key: "mousedown", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mousedown", value: cb' value })
instance Attr anything OnMousedown (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnMousedown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousedown", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mousedown", value: cb' value })
instance Attr anything OnMousedown  Cb  where
  attr OnMousedown value = unsafeAttribute $ This $ pure $
    { key: "mousedown", value: cb' value }
instance Attr anything OnMousedown (Event.Event  Cb ) where
  attr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' value }

instance Attr anything OnMousedown (ST.ST Global.Global  Cb ) where
  attr OnMousedown iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousedown", value: cb' value }

instance Attr anything OnMousedown (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMousedown bothValues = unsafeAttribute $ Both (pure 
    { key: "mousedown", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousedown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousedown (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnMousedown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousedown", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mousedown", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMousedown  (Effect Unit)  where
  attr OnMousedown value = unsafeAttribute $ This $ pure $
    { key: "mousedown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMousedown (Event.Event  (Effect Unit) ) where
  attr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousedown (ST.ST Global.Global  (Effect Unit) ) where
  attr OnMousedown iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousedown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousedown (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMousedown bothValues = unsafeAttribute $ Both (pure 
    { key: "mousedown", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mousedown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousedown (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnMousedown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mousedown", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mousedown", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMousedown  (Effect Boolean)  where
  attr OnMousedown value = unsafeAttribute $ This $ pure $
    { key: "mousedown", value: cb' (Cb (const value)) }
instance Attr anything OnMousedown (Event.Event  (Effect Boolean) ) where
  attr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mousedown", value: cb' (Cb (const value)) }

instance Attr anything OnMousedown (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnMousedown iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mousedown", value: cb' (Cb (const value)) }

instance Attr everything OnMousedown (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMousedown bothValues = unsafeAttribute $ Both (pure 
    { key: "mousedown", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mousedown", value: unset' })
instance Attr everything OnMousedown (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnMousedown (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "mousedown", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mousedown", value: unset' })
instance Attr everything OnMousedown  Unit  where
  attr OnMousedown _ = unsafeAttribute $ This $ pure $
    { key: "mousedown", value: unset' }
instance Attr everything OnMousedown (Event.Event  Unit ) where
  attr OnMousedown eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mousedown", value: unset' }

instance Attr everything OnMousedown (ST.ST Global.Global  Unit ) where
  attr OnMousedown iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "mousedown", value: unset' }
