module Deku.DOM.Attr.OnMouseup where

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

data OnMouseup = OnMouseup

instance Attr anything OnMouseup (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnMouseup bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseup", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "mouseup", value: cb' value })
instance Attr anything OnMouseup (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnMouseup (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseup", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "mouseup", value: cb' value })
instance Attr anything OnMouseup  Cb  where
  attr OnMouseup value = unsafeAttribute $ This $ pure $
    { key: "mouseup", value: cb' value }
instance Attr anything OnMouseup (Event.Event  Cb ) where
  attr OnMouseup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseup", value: cb' value }

instance Attr anything OnMouseup (ST.ST Global.Global  Cb ) where
  attr OnMouseup iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseup", value: cb' value }

instance Attr anything OnMouseup (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnMouseup bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseup", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseup", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseup (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnMouseup (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseup", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseup", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnMouseup  (Effect Unit)  where
  attr OnMouseup value = unsafeAttribute $ This $ pure $
    { key: "mouseup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseup (Event.Event  (Effect Unit) ) where
  attr OnMouseup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseup (ST.ST Global.Global  (Effect Unit) ) where
  attr OnMouseup iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseup (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnMouseup bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseup", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "mouseup", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseup (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnMouseup (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "mouseup", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "mouseup", value: cb' (Cb (const value)) }
    )
instance Attr anything OnMouseup  (Effect Boolean)  where
  attr OnMouseup value = unsafeAttribute $ This $ pure $
    { key: "mouseup", value: cb' (Cb (const value)) }
instance Attr anything OnMouseup (Event.Event  (Effect Boolean) ) where
  attr OnMouseup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "mouseup", value: cb' (Cb (const value)) }

instance Attr anything OnMouseup (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnMouseup iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "mouseup", value: cb' (Cb (const value)) }

instance Attr everything OnMouseup (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnMouseup bothValues = unsafeAttribute $ Both (pure 
    { key: "mouseup", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "mouseup", value: unset' })
instance Attr everything OnMouseup (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnMouseup (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "mouseup", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "mouseup", value: unset' })
instance Attr everything OnMouseup  Unit  where
  attr OnMouseup _ = unsafeAttribute $ This $ pure $
    { key: "mouseup", value: unset' }
instance Attr everything OnMouseup (Event.Event  Unit ) where
  attr OnMouseup eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "mouseup", value: unset' }

instance Attr everything OnMouseup (ST.ST Global.Global  Unit ) where
  attr OnMouseup iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "mouseup", value: unset' }
