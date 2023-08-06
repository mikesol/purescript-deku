module Deku.DOM.Attr.OnLoadend where

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

data OnLoadend = OnLoadend

instance Attr anything OnLoadend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoadend bothValues = unsafeAttribute $ Both (pure 
    { key: "loadend", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "loadend", value: cb' value })
instance Attr anything OnLoadend (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnLoadend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadend", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "loadend", value: cb' value })
instance Attr anything OnLoadend  Cb  where
  attr OnLoadend value = unsafeAttribute $ This $ pure $
    { key: "loadend", value: cb' value }
instance Attr anything OnLoadend (Event.Event  Cb ) where
  attr OnLoadend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadend", value: cb' value }

instance Attr anything OnLoadend (ST.ST Global.Global  Cb ) where
  attr OnLoadend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "loadend", value: cb' value }

instance Attr anything OnLoadend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoadend bothValues = unsafeAttribute $ Both (pure 
    { key: "loadend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnLoadend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadend", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "loadend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadend  (Effect Unit)  where
  attr OnLoadend value = unsafeAttribute $ This $ pure $
    { key: "loadend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadend (Event.Event  (Effect Unit) ) where
  attr OnLoadend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadend (ST.ST Global.Global  (Effect Unit) ) where
  attr OnLoadend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "loadend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoadend bothValues = unsafeAttribute $ Both (pure 
    { key: "loadend", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnLoadend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadend", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "loadend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadend  (Effect Boolean)  where
  attr OnLoadend value = unsafeAttribute $ This $ pure $
    { key: "loadend", value: cb' (Cb (const value)) }
instance Attr anything OnLoadend (Event.Event  (Effect Boolean) ) where
  attr OnLoadend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadend", value: cb' (Cb (const value)) }

instance Attr anything OnLoadend (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnLoadend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "loadend", value: cb' (Cb (const value)) }

instance Attr everything OnLoadend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoadend bothValues = unsafeAttribute $ Both (pure 
    { key: "loadend", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadend", value: unset' })
instance Attr everything OnLoadend (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnLoadend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "loadend", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "loadend", value: unset' })
instance Attr everything OnLoadend  Unit  where
  attr OnLoadend _ = unsafeAttribute $ This $ pure $
    { key: "loadend", value: unset' }
instance Attr everything OnLoadend (Event.Event  Unit ) where
  attr OnLoadend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "loadend", value: unset' }

instance Attr everything OnLoadend (ST.ST Global.Global  Unit ) where
  attr OnLoadend iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "loadend", value: unset' }
