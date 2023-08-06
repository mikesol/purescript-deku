module Deku.DOM.Attr.OnResize where

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

data OnResize = OnResize

instance Attr anything OnResize (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnResize bothValues = unsafeAttribute $ Both (pure 
    { key: "resize", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "resize", value: cb' value })
instance Attr anything OnResize (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnResize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "resize", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "resize", value: cb' value })
instance Attr anything OnResize  Cb  where
  attr OnResize value = unsafeAttribute $ This $ pure $
    { key: "resize", value: cb' value }
instance Attr anything OnResize (Event.Event  Cb ) where
  attr OnResize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "resize", value: cb' value }

instance Attr anything OnResize (ST.ST Global.Global  Cb ) where
  attr OnResize iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "resize", value: cb' value }

instance Attr anything OnResize (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnResize bothValues = unsafeAttribute $ Both (pure 
    { key: "resize", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "resize", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnResize (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnResize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "resize", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "resize", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnResize  (Effect Unit)  where
  attr OnResize value = unsafeAttribute $ This $ pure $
    { key: "resize", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnResize (Event.Event  (Effect Unit) ) where
  attr OnResize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "resize", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnResize (ST.ST Global.Global  (Effect Unit) ) where
  attr OnResize iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "resize", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnResize (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnResize bothValues = unsafeAttribute $ Both (pure 
    { key: "resize", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "resize", value: cb' (Cb (const value)) }
    )
instance Attr anything OnResize (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnResize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "resize", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "resize", value: cb' (Cb (const value)) }
    )
instance Attr anything OnResize  (Effect Boolean)  where
  attr OnResize value = unsafeAttribute $ This $ pure $
    { key: "resize", value: cb' (Cb (const value)) }
instance Attr anything OnResize (Event.Event  (Effect Boolean) ) where
  attr OnResize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "resize", value: cb' (Cb (const value)) }

instance Attr anything OnResize (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnResize iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "resize", value: cb' (Cb (const value)) }

instance Attr everything OnResize (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnResize bothValues = unsafeAttribute $ Both (pure 
    { key: "resize", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "resize", value: unset' })
instance Attr everything OnResize (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnResize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "resize", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "resize", value: unset' })
instance Attr everything OnResize  Unit  where
  attr OnResize _ = unsafeAttribute $ This $ { key: "resize", value: unset' }
instance Attr everything OnResize (Event.Event  Unit ) where
  attr OnResize eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "resize", value: unset' }

instance Attr everything OnResize (ST.ST Global.Global  Unit ) where
  attr OnResize iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "resize", value: unset' }
